module RedmineMentions
  module MailerPatch
    def self.apply
      Mailer.class_eval do
        prepend InstanceMethods
      end unless Mailer < InstanceMethods
    end

    module InstanceMethods
      def notify_mentioning(issue, journal, user)
        @issue = issue
        @journal = journal
        mail(to: user.mail, subject: "[#{@issue.tracker.name} ##{@issue.id}] You were mentioned in: #{@issue.subject}")
      end
    end
  end
end
