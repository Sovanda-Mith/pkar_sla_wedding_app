import { Body, Injectable } from '@nestjs/common';
import { CreateUserDto } from 'src/user/dto/create-user.dto';
import { UserService } from 'src/user/user.service';

@Injectable()
export class AuthService {
  constructor(private userService: UserService) {}

  async signUp(@Body() createUserDTO: CreateUserDto) {
    return this.userService.create(createUserDTO);
  }

  async signIn(@Body() createUserDTO: CreateUserDto) {
    return this.userService.signIn(createUserDTO);
  }
}
