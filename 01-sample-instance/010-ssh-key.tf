# Define ssh to config in instance

# Create default ssh publique key
resource "aws_key_pair" "user_key" {
  key_name   = "my-demo-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCtjwQPOoU46oAnb1Z3s8dp3p/xGEaGpApPliMgZno8+dOOkMai7sIlqrkLFB8SK01MNJVfNQNA3S9IQFpllJ7Z8U6BNKyKz5KR5YbHu+pkhp9qAwg6Rw3bd6CW81aI/TEjgzxOQ0mxtb8P/ku7FHL1W5ABF+bVmKORUfe0iIdbz46NHDA81ucVd4T5dAmu7EgouXdujQ5tU/8F9xWDXPjeBepq6AVY4+03i3oZOJfRPRY3HGxrtDv7aTwtRCjPcWQBSK2zFOz9BghusSWUY5/BUENuth/ijcmPUuqgkzYhN/Y54Z9wBoVbBK+tAr/isK0IzeOU/6+aBHebxITzkaIl"
#  public_key = file("~/.ssh/id_rsa.pub")
}
