require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '#columns #side a', minimum: 4
    assert_select '#main .entry', minimum: 3
    assert_select 'h3', 'Programing Ruby 1.9'
    assert_select '.price', /\$[,\d]+\.\d\d/
    assert_select '#visit_counter', 0
  end

  test 'counter should be visible after 6 entries' do
    get :index
    assert_select '#visit_counter', 0
    5.times { get :index }
    assert_select '#visit_counter', 1
  end

  test 'markup needed for store.coffee is in place' do
    get :index
    assert_select '.store .entry > img', 4
    assert_select '.entry input[type=submit]', 4
  end
end
