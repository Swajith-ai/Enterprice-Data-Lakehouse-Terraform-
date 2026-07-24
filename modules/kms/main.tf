#################################################
# Customer Managed KMS Key
#################################################

resource "aws_kms_key" "this" {

  description = var.kms_key_description

  deletion_window_in_days = var.deletion_window_in_days

  enable_key_rotation = var.enable_key_rotation

  tags = merge(
    var.common_tags,
    {
      Name = "${var.naming_prefix}-kms-key"
    }
  )

}

#################################################
# KMS Alias
#################################################

resource "aws_kms_alias" "this" {

  name = var.kms_alias

  target_key_id = aws_kms_key.this.key_id

}

