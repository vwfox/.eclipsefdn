local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-daanse') {
  settings+: {
    billing_email: "webmaster@eclipse-foundation.org",
    dependabot_alerts_enabled_for_new_repositories: true,
    dependabot_security_updates_enabled_for_new_repositories: true,
    dependency_graph_enabled_for_new_repositories: true,
    description: "The Eclipse Daanse Project - Data Analysis Services",
    members_can_change_project_visibility: false,
    members_can_change_repo_visibility: false,
    members_can_create_teams: false,
    members_can_delete_repositories: false,
    name: "Eclipse Daanse",
    packages_containers_internal: false,
    packages_containers_public: false,
    plan: "free",
    readers_can_create_discussions: true,
    two_factor_requirement: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('demo-repository') {
      allow_forking: false,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "A code repository designed to show the best GitHub has to offer.",
      has_wiki: false,
      private: true,
      web_commit_signoff_required: false,
    },
  ],
}
