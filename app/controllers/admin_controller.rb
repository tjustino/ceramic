# frozen_string_literal: true

# Admin Controller
class AdminController < ApplicationController
  before_action :restrict_access

  # include CurrentCart
  # before_action :set_cart, only: [:index]

  # GET /admin
  def index; end
end
