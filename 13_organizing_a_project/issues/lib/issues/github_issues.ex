defmodule Issues.GitHubIssues do
  require Logger

  @user_agent [ { "User-agent", "Elixir test program" }]
  @github_url Application.get_env(:issues, :github_url)

  def fetch(user, project) do
    Logger.info "Fetching issues for #{user}/#{project}"
    issues_url(user, project)
      |> HTTPoison.get(@user_agent)
      |> handle_response
  end

  def issues_url(user, project) do
    "#{@github_url}/repos/#{user}/#{project}/issues"
  end

  def handle_response({:ok, %{status_code: 200, body: body}}) do
    { :ok, Poison.decode!(body) }
  end

  def handle_response({:ok, %{status_code: _, body: body}}) do
    { :error, Poison.decode!(body) }
  end

  def handle_response({:error, %{status_code: _, body: body}}), do: { :error, body }
end
