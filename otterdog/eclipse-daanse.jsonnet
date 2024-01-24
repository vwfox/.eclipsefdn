local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-daanse') {
  settings+: {
    billing_email: "webmaster@eclipse-foundation.org",
    dependabot_alerts_enabled_for_new_repositories: true,
    dependabot_security_updates_enabled_for_new_repositories: true,
    dependency_graph_enabled_for_new_repositories: true,
    description: "The Eclipse Daanse Project - Data Analysis Services",
    name: "Eclipse Daanse",
    plan: "free",
    readers_can_create_discussions: true,
    two_factor_requirement: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('org.eclipse.daanse.common') {
      allow_merge_commit: false,
      allow_rebase_merge: true,
      allow_squash_merge: false,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: true,
      dependabot_security_updates_enabled: true,
      description: "Repository for the common modules",
      has_wiki: false,
      private: false,
      web_commit_signoff_required: true,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          requires_pull_request: true,
          required_approving_review_count: 1,
          required_status_checks+: [],
          requires_linear_history: true,
          requires_strict_status_checks: true,
          requires_commit_signatures: true,
        },
      ],
    },
    orgs.newRepo('eclipse-daanse.github.io') {
      allow_merge_commit: false,
      allow_rebase_merge: true,
      allow_squash_merge: false,
      allow_update_branch: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "main",
      gh_pages_source_path: "/",
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "main"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
  ],
}
