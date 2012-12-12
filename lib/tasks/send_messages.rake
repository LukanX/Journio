desc "Sends scheduled SMS messages"
task :send_messages => :environment do
	studies = Study.all
	studies.each do |s|
		s.scheduled_messages.each do |m|
			m.send_message
		end
	end
end