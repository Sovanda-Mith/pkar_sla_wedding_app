import { Module } from '@nestjs/common';
import { BusinessService } from './business.service';
import { BusinessController } from './business.controller';

@Module({
  controllers: [BusinessController],
  providers: [BusinessService],
  imports: [],
})
export class BusinessModule {}
