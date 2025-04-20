name: 🐛 Bug Report
description: Report a bug to help us improve
title: "[BUG] "
labels: ["bug"]

body:

- type: textarea
  attributes:
  label: Description
  description: Describe the bug clearly.
  validations:
  required: true

- type: textarea
  attributes:
  label: Steps to reproduce
  description: What steps should we follow to reproduce the bug?
  validations:
  required: true

- type: textarea
  attributes:
  label: Expected behavior
  description: What did you expect to happen?
  validations:
  required: true

- type: textarea
  attributes:
  label: Screenshots
  description: If applicable, add screenshots to help explain your problem.
