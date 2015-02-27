require_relative "yaml_repository"

class RepositoryInterface

  def self.register(repo_type, repo)
    repositories[repo_type] = repo
  end

  def self.repositories
    @repositories ||= {}
  end

  def self.for(repo_type)
    repositories[repo_type]
  end
end
