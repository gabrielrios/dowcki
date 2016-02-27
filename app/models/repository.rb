
class Repository
  attr_reader :url, :path

  def initialize(project)
    @url = project.repository_url
    @path = Rails.root.join("tmp", "repo", project.name).to_s
  end

  def clone
    if already_cloned?
      update
    else
      _clone
    end
  end

  def _clone
    Rugged::Repository.clone_at(url, path)
  end

  def already_cloned?
    repo
    return true
  rescue Rugged::RepositoryError, Rugged::OSError
    return false
  end

  def update
  end

  def repo
    @repo ||= Rugged::Repository.new(path)
  end

end
