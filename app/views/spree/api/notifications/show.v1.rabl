object @notification
attributes :id, :status
node(:content) { |n| n.notification.content }
node(:detail_content) { |n| n.notification.detail_content }
node(:pushed_on) { |n| n.notification.pushed_on }

