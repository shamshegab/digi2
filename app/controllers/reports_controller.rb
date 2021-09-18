class ReportsController < ApplicationController
    before_action :authorize_controller
    def index
    
    end

    def generate_reports
       @cases_report = Case.all.where(created_at: params[:From]..params[:To])
       @cases_sum = calculate_sum(@cases_report)
       @doctors_report = []
       ReferringDoctor.all.each do |doctor|
        report = {:name=> doctor.name}
        report[:items]= referring_doctor_report(doctor)
        report[:sum]= referring_doctor_sum(doctor)
        @doctors_report.push(report)
       end
       sql = "SELECT title, COALESCE(COUNT(used_items.item_id),0) FROM used_items INNER JOIN cases On cases.id = used_items.case_id  AND cases.created_at >= '"+ params[:From].to_s + "' AND cases.created_at < '" + params[:To].to_s + "'RIGHT JOIN  items ON items.id=used_items.item_id RIGHT JOIN referring_doctors ON cases.referring_doctor_id = referring_doctors.id GROUP BY items.id ORDER BY items.id"
       res = ActiveRecord::Base.connection.execute(sql)
       @doctors_totals= res.values

       sql = "SELECT SUM(used_items.charged_price) FROM used_items INNER JOIN cases On cases.id = used_items.case_id AND cases.created_at >= '"+ params[:From].to_s + "' AND cases.created_at < '" + params[:To].to_s + "' RIGHT JOIN items ON items.id=used_items.item_id INNER JOIN referring_doctors ON cases.referring_doctor_id = referring_doctors.id"
       res = ActiveRecord::Base.connection.execute(sql)
       @doctors_sum = res.values

       @technitions_report = []
       User.technitions.each do |tech|
        report = {:name=> tech.name}
        report[:items]= technition_report(tech)
        report[:sum]=tech_sum(tech)
        @technitions_report.push(report)
       end
       sql = "SELECT  COALESCE(SUM(used_items.charged_price),0) FROM used_items INNER JOIN cases On cases.id = used_items.case_id  AND cases.created_at >= '"+ params[:From].to_s + "' AND cases.created_at < '" + params[:To].to_s + "'RIGHT JOIN  items ON items.id=used_items.item_id RIGHT JOIN users ON cases.technition_id = users.id "
       res = ActiveRecord::Base.connection.execute(sql)
       @tech_totals= res.values
       sql = "SELECT title, COALESCE(SUM(used_items.charged_price),0) FROM used_items INNER JOIN cases On cases.id = used_items.case_id  AND cases.created_at >= '"+ params[:From].to_s + "' AND cases.created_at < '" + params[:To].to_s + "' RIGHT JOIN items ON items.id=used_items.item_id GROUP BY items.id ORDER BY items.id"
       res = ActiveRecord::Base.connection.execute(sql)
       @items_total = res.values

    end

    def referring_doctor_report(doctor)
        sql = "SELECT title, COUNT(used_items.item_id), SUM(used_items.charged_price) FROM used_items INNER JOIN cases On cases.id = used_items.case_id AND cases.referring_doctor_id = #{doctor.id} AND cases.created_at >= '"+ params[:From].to_s + "' AND cases.created_at < '" + params[:To].to_s + "'RIGHT JOIN  items ON items.id=used_items.item_id GROUP BY items.id ORDER BY items.id"
        res = ActiveRecord::Base.connection.execute(sql)
        return res.values
    end

    def referring_doctor_sum(doctor)
        sql = "SELECT SUM(used_items.charged_price) FROM used_items INNER JOIN cases On cases.id = used_items.case_id AND cases.referring_doctor_id=#{doctor.id} AND cases.created_at >= '"+ params[:From].to_s + "' AND cases.created_at < '" + params[:To].to_s + "'GROUP BY cases.referring_doctor_id"
        res = ActiveRecord::Base.connection.execute(sql)
        return res.values
    end

    def tech_sum(tech)
        sql = "SELECT SUM(used_items.charged_price) FROM used_items INNER JOIN cases On cases.id = used_items.case_id AND cases.technition_id=#{tech.id} AND cases.created_at >= '"+ params[:From].to_s + "' AND cases.created_at < '" + params[:To].to_s + "'RIGHT JOIN items ON items.id=used_items.item_id GROUP BY cases.technition_id"
        res = ActiveRecord::Base.connection.execute(sql)
        return res.values
    end


    def technition_report(tech)
        sql = "SELECT title, COUNT(used_items.item_id),SUM(used_items.charged_price) FROM used_items INNER JOIN cases On cases.id = used_items.case_id AND cases.technition_id = #{tech.id} AND cases.created_at >= '"+ params[:From].to_s + "' AND cases.created_at < '" + params[:To].to_s + "' RIGHT JOIN items ON items.id=used_items.item_id GROUP BY items.id ORDER BY items.id"
        res = ActiveRecord::Base.connection.execute(sql)
        return res.values
    end

    def calculate_sum(cases)
        @sum = 0
        cases.each do |x_case|
            @sum = @sum +  x_case.used_items.sum(:charged_price)
        end
        return @sum
    end
    def report_params
        params.permit(:From, :To)
    end
    def authorize_controller
        if !current_user.admin? && !current_user.accounting?
          redirect_to root_path
        end
      end
end