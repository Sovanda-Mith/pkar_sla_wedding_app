import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';
import { BusinessProfile } from 'src/business/entities/business-profile.entity';
import { ServiceType } from '../enum/service-type.enum';

@Entity('services')
export class Service {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @ManyToOne(() => BusinessProfile, (business) => business.services)
  business: BusinessProfile;

  @Column({ type: 'enum', enum: ServiceType })
  type: ServiceType;

  @Column({ default: true })
  available: boolean;
}
