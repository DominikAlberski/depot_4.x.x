#
module VisitCounter
  extend ActiveSupport::Concern

  private

  def set_visit_counter
    if session[:visit_counter].nil?
      session[:visit_counter] = 1
    else
      session[:visit_counter] += 1
    end
    @visit_counter = session[:visit_counter]
  end
end
