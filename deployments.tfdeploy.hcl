# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

deployment "simple" {
  inputs = {
    prefix           = "simple"
    instances        = 1
  }
}

deployment "complex" {
  inputs = {
    prefix           = "complex"
    instances        = 3
  }
}

orchestrate "auto_approve" "auto_approve_simple" {
  check {
    condition = context.plan.deployment == deployment.simple
    reason    = "auto approve for load tests"
  }
}

orchestrate "auto_approve" "auto_approve_complex" {
  check {
    condition = context.plan.deployment == deployment.complex
    reason    = "auto approve for load tests"
  }
}
