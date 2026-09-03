# Keep each service's image in its own Region.
resource "aws_ecr_repository" "east" {
  name         = "multi-region-app-east"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "west" {
  provider     = aws.west
  name         = "multi-region-app-west"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }
}