locals {
  tagging_actions = [
    "s3:Get*Tagging",
  ]

  unrelated_value = true

  object_actions = [
    "s3:PutObject*",
  ]
}
