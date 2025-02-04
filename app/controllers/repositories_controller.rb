# frozen_string_literal: true

class RepositoriesController < ApplicationController
  def index
    @total_count = 0

    return unless github_connector

    @user_starred_repositories = current_user.repositories.pluck(:external_id) if current_user.present?
    @total_count = github_connector.total_count
    @repositories = github_connector.repositories
  end

  private

  def search_params
    params.permit(:language, :page)
  end

  def github_connector
    @github_connector ||= Github::Repositories.new(search_params).call
  end
end
