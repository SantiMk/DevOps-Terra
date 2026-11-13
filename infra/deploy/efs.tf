##########################
# EFS for media storage. #
##########################

resource "aws_efs_file_system" "media" {
  encrypted = true
  tags = {
    Name = "${local.prefix}-media"
  }
}

resource "aws_security_group" "efs" {
  name   = "${local.prefix}-efs"
  vpc_id = aws_vpc.main.id


  ingress {
    from_port = 2049 #Puerto NFS estandar
    to_port   = 2049
    protocol  = "tcp"
    #Permite que un equipo cliente lea, escriba y gestione archivos en un servidor remoto de tipo Unix/Linux

    security_groups = [
      aws_security_group.ecs_service.id
    ]
  }
}
