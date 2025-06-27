import { Injectable, UnauthorizedException } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { Repository } from 'typeorm';
import * as bcrypt from 'bcryptjs';
import { User } from './entities/user.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { UserProfile } from './entities/user-profile.entity';

@Injectable()
export class UserService {
  constructor(
    @InjectRepository(User)
    private userRepo: Repository<User>,
  ) {}

  async create(createUserDto: CreateUserDto) {
    const user = new User();
    user.email = createUserDto.email;
    user.password = await bcrypt.hash(createUserDto.password, 10);

    const profile = new UserProfile();
    profile.username = createUserDto.username;

    user.profile = profile;

    return this.userRepo.save(user);
  }

  async signIn(createUserDto: CreateUserDto) {
    const user = await this.userRepo.findOne({
      where: {
        profile: {
          username: createUserDto.username,
        },
      },
      relations: ['profile'],
    });

    if (!user) throw new UnauthorizedException('Invalid credentials');

    const isMatch = await bcrypt.compare(createUserDto.password, user.password);

    if (!isMatch) throw new UnauthorizedException('Invalid credentials');

    return user;
  }

  findAll() {
    return `This action returns all user`;
  }

  findOne(id: number) {
    return `This action returns a #${id} user`;
  }

  update(id: number, updateUserDto: UpdateUserDto) {
    return `This action updates a #${id} user`;
  }

  remove(id: number) {
    return `This action removes a #${id} user`;
  }
}
