class SimulateRollsController < ApplicationController
  def index
    render_simulation
  end

  def clear
    session[:simulation] = nil
    redirect_to :action => :index
  end

  def simulate
    roll = params[:faces].split('-').map { |s| s.to_i }
    session[:simulation] ||= []
    sim_data.push(roll)
    redirect_to :action => :index
  end

  private

  def render_simulation
    if sim_data
      render :text => "SIMULATING: #{sim_data.inspect}"
    else
      render :text => "SIMULATION IS OFF"
    end
  end

  def sim_data
    session[:simulation]
  end
end
