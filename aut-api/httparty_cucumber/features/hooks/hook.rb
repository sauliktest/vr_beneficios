at_exit do
  time = Time.now.strftime("%d/%m/%Y %H:%M")

  ReportBuilder.configure do |config|
    config.input_path = 'report.json'
    config.report_path = 'log/build_reports'
    config.report_types = [:html]
    config.report_title = 'Regression API Test VR - Depto Qualidade'
    config.color = 'indigo'
    config.additional_info = { 'Browser': ENV['BROWSER'], 'Ambiente': ENV['TEST_ENV'],'Sprint': ENV['TEST_SPRINT'], 'Horário': time }
  end


  ReportBuilder.build_report
end
