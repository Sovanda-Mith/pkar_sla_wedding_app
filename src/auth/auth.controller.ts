import { Body, Controller, Post } from '@nestjs/common';
import { AuthService } from './auth.service';
import { CreateUserDto } from 'src/user/dto/create-user.dto';

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}
  @Post('signup')
  signUp(@Body() createUserDTO: CreateUserDto) {
    return this.authService.signUp(createUserDTO);
  }

  @Post('signin')
  signIn(@Body() createUserDTO: CreateUserDto) {
    return this.authService.signIn(createUserDTO);
  }
}
