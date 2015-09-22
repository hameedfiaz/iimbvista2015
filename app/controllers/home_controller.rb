class HomeController < ApplicationController
	layout false
	
  def index
  end

  def acco_n_travel
  end

  def schedule
  	@schedule_items=ScheduleItem.all(:order => 'event_start, event_end')
  	@days=@schedule_items.collect(&:event_start).collect(&:to_date).uniq
  end
end
