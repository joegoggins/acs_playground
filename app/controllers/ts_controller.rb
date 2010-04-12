class TsController < ApplicationController
  # GET /ts
  # GET /ts.xml
  def index
    @ts = T.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ts }
    end
  end

  # GET /ts/1
  # GET /ts/1.xml
  def show
    @t = T.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @t }
    end
  end

  # GET /ts/new
  # GET /ts/new.xml
  def new
    @t = T.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @t }
    end
  end

  # GET /ts/1/edit
  def edit
    @t = T.find(params[:id])
  end

  # POST /ts
  # POST /ts.xml
  def create
    @t = T.new(params[:t])

    respond_to do |format|
      if @t.save
        flash[:notice] = 'T was successfully created.'
        format.html { redirect_to(@t) }
        format.xml  { render :xml => @t, :status => :created, :location => @t }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @t.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ts/1
  # PUT /ts/1.xml
  def update
    @t = T.find(params[:id])

    respond_to do |format|
      if @t.update_attributes(params[:t])
        flash[:notice] = 'T was successfully updated.'
        format.html { redirect_to(@t) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @t.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ts/1
  # DELETE /ts/1.xml
  def destroy
    @t = T.find(params[:id])
    @t.destroy

    respond_to do |format|
      format.html { redirect_to(ts_url) }
      format.xml  { head :ok }
    end
  end
end
