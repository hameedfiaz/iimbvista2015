class EventTabsController < ApplicationController
  # GET /event_tabs
  # GET /event_tabs.json
  before_filter :check_permission

  def check_permission
   authorize! :manage, EventTab
 end

 def index
  redirect_to :action => "for_event"
  # @event_tabs = EventTab.all

  # respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @event_tabs }
  #   end
  end

  # GET /event_tabs/1
  # GET /event_tabs/1.json
  def show
    @event_tab = EventTab.unscoped.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_tab }
    end
  end

  # GET /event_tabs/new
  # GET /event_tabs/new.json
  def new
    if current_user.is_super_admin?
      @events=Event.unscoped.all
    else
      @events = current_user.event_categories.collect{|ec| ec.events}
    end
    @events=@events.flatten.compact
    @event_tab = EventTab.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_tab }
    end
  end

  # GET /event_tabs/1/edit
  def edit
    if current_user.is_super_admin?
      @events=Event.unscoped.all
    else
      @events = current_user.event_categories.collect{|ec| ec.events}
    end
    @events=@events.flatten.compact
    @event_tab = EventTab.unscoped.find(params[:id])
  end

  # POST /event_tabs
  # POST /event_tabs.json
  def create
    @event_tab = EventTab.new(params[:event_tab])

    respond_to do |format|
      if @event_tab.save
        format.html { redirect_to @event_tab, notice: 'Event tab was successfully created.' }
        format.json { render json: @event_tab, status: :created, location: @event_tab }
      else
        format.html { render action: "new" }
        format.json { render json: @event_tab.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_tabs/1
  # PUT /event_tabs/1.json
  def update
    @event_tab = EventTab.unscoped.find(params[:id])

    respond_to do |format|
      if @event_tab.update_attributes(params[:event_tab])
        format.html { redirect_to @event_tab, notice: 'Event tab was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_tab.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_tabs/1
  # DELETE /event_tabs/1.json
  def destroy
    @event_tab = EventTab.unscoped.find(params[:id])
    @event_tab.destroy

    respond_to do |format|
      format.html { redirect_to event_tabs_url }
      format.json { head :no_content }
    end
  end

  def for_event
    event_id = params[:id]
    event=Event.unscoped.find_by_id(event_id)
    @event_cat = event.event_category_id
    @event_tabs=EventTab.unscoped.where(event_id: event_id )
    render :template => "/event_tabs/index"
  end
end
