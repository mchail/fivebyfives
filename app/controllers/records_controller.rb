class RecordsController < ApplicationController
  # GET /records
  # GET /records.json
  def index
    @records = current_user.records

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @records }
    end
  end

  # GET /records/1
  # GET /records/1.json
  def show
    @record = Record.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @record }
    end
  end

  # GET /records/new
  # GET /records/new.json
  def new
    @record = Record.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @record }
    end
  end

  # GET /records/1/edit
  def edit
    @record = Record.find(params[:id])
  end

  # POST /records
  # POST /records.json
  def create
    @record = Record.new(params[:record])

    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, notice: 'Record was successfully created.' }
        format.json { render json: @record, status: :created, location: @record }
      else
        format.html { render action: "new" }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /records/1
  # PUT /records/1.json
  def update
    @record = Record.find(params[:id])

    respond_to do |format|
      if @record.update_attributes(params[:record])
        format.html { redirect_to @record, notice: 'Record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record = Record.find(params[:id])
    @record.destroy

    respond_to do |format|
      format.html { redirect_to records_url }
      format.json { head :no_content }
    end
  end

  def complete_workout
    user = current_user
    record = user.records.create

    params[:ex].keys.each do |s|
      exercise = Exercise.find(s.split('_').last)
      line = record.lines.create(
        weight: params[:ex][s][:weight],
        duration: params[:ex][s][:time]
      )
      exercise.lines << line
      exercise.save!
    end

    user.rotation = user.rotation == 1 ? 2 : 1
    user.save!

    redirect_to records_path
  end
end
