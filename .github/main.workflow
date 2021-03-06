workflow "PR" {
  on = "push"
  resolves = ["docker://node:10-2"]
}

workflow "New workflow" {
  on = "push"
  resolves = ["Filters for GitHub Actions"]
}

action "docker://node:10" {
  uses = "docker://node:10"
  args = "echo \"this is push\""
}

action "Filters for GitHub Actions" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  needs = ["docker://node:10"]
  args = "ref refs/heads/*/merge"
}

action "docker://node:10-1" {
  uses = "docker://node:10"
  args = "echo \"docker saysm\""
}

action "pr-checker" {
  uses = "./pr-fork-checker"
}

action "docker://node:10-2" {
  uses = "docker://node:10"
  needs = ["pr-checker"]
  args = "echo \"PR\""
}
