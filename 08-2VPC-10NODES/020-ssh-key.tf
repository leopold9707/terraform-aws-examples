# Define ssh to config in instance

# Create default ssh publique key
data "aws_key_pair" "user_key" {
  key_name = "terraform"
}
