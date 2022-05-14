#!/usr/bin/env bash

# NOTE: You cannot use "sudo" here
# That's a limitation of Terraform "free edition"

# Only install what's needed to get ansible to connect.
# In this example, we need nothing, so we'll create a file.
touch /root/script_ran;
