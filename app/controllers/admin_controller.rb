# frozen_string_literal: true

# Admin Controller
class AdminController < ApplicationController
  include CurrentCart
  before_action :restrict_access
  before_action :set_cart, only: [:index]

  def index; end
end
