			variable "env"{
     description= "This is the enviroment for my infra"
      type=string
}
		
		          variable "bucket_name"{
          description="this is my bucket name for infra"
          type= string

}
variable "instance_count"{
description="this is the no. of ec2 instance "
type=number
}

variable "instance_type"{
description="this is instance type for my infra"
type=string
}
		
		
		variable "ec2_ami_id"{
description="this is my ami id for my infra"
type=string
}

variable "hash_key"{
description="this is my hash key for my infra dynamodb"
type=string 
}
