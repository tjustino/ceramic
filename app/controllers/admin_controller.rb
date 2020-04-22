# frozen_string_literal: true

# Admin Controller
class AdminController < ApplicationController
  include RestrictAccess
  before_action :restrict_to_admin

  # GET /admin
  def index; end
end
