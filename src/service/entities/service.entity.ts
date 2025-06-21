import {
  Column,
  Entity,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { BusinessProfile } from 'src/business/entities/business-profile.entity';
import { ServiceType } from '../enum/service-type.enum';
import { Booking } from 'src/booking/entities/booking.entity';

@Entity('services')
export class Service {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @ManyToOne(() => BusinessProfile, (business) => business.services)
  business: BusinessProfile;

  @OneToMany(() => Booking, (booking) => booking.service)
  bookings: Booking[];

  @Column({ type: 'enum', enum: ServiceType })
  type: ServiceType;

  @Column({ default: true })
  available: boolean;
}
