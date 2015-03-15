class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:show, :edit, :update, :destroy]

  # GET /attendees
  # GET /attendees.json
  def index
    @attendees = Attendee.order('trip_id')
    @grouped_by_trips = @attendees.group_by { |attendee| attendee.trip_id } 
      # See “Ramblings”, below
    @trips = Trip.all
  end

  # GET /attendees/1
  # GET /attendees/1.json
  def show
  end

  # GET /attendees/new
  def new
    @attendee = Attendee.new
  end

  # GET /attendees/1/edit
  def edit
  end

  # POST /attendees
  # POST /attendees.json
  def create
    @attendee = Attendee.new(attendee_params)

    respond_to do |format|
      if @attendee.save
        format.html { redirect_to @attendee, notice: 'Attendee was successfully created.' }
        format.json { render :show, status: :created, location: @attendee }
      else
        format.html { render :new }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendees/1
  # PATCH/PUT /attendees/1.json
  def update
    respond_to do |format|
      if @attendee.update(attendee_params)
        format.html { redirect_to @attendee, notice: 'Attendee was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendee }
      else
        format.html { render :edit }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendees/1
  # DELETE /attendees/1.json
  def destroy
    @attendee.destroy
    respond_to do |format|
      format.html { redirect_to attendees_url, notice: 'Attendee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendee
      @attendee = Attendee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendee_params
      params.require(:attendee).permit(:supporter_id, :trip_id)
    end
end


# Ramblings

# --> @attendees = Attendee.order('trip_id') <--
# This makes a call on the database:  SELECT "attendees".* FROM "attendees"  ORDER BY trip_id
# What gets returned is an array of hashes.
# Each hash is one row from the table.
# The keys are the column names, the values are the column values.
# The hashes are ordered in the array by the column "trip_id".
# When you have ‘attendees.each’, you're iterating through the array.

# --> @grouped_by_trips = @attendees.group_by { |attendee| attendee.trip_id } <--
# This operates on the array that contains hashes that are table rows.
# It returns a hash of hashes.
# For the outer hash:
#   the keys are the values of ‘attendee.trip_id’
#   the values are all the table rows with ‘attendee.trip_id’ that matches the key
# For the nested hash:
#   the keys are the column names of the table
#   the values are the column values of the table

# Compressed/formatted example:
#
# > @grouped_by_ts = @as.group_by { |a| a.t_id }
# => {1=>[#<A id: 1, s_id: 1, t_id: 1>, 
#         #<A id: 2, s_id: 4, t_id: 1>, 
#         #<A id: 6, s_id: 5, t_id: 1>], 
#     3=>[#<A id: 3, s_id: 2, t_id: 3>, 
#         #<A id: 4, s_id: 3, t_id: 3>, 
#         #<A id: 5, s_id: 1, t_id: 3>]} 

# In the view, you iterate through the hash, with another nested iteration to go
# through the nested hash.  Something like:
#
# 


