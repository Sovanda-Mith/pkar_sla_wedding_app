import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';
import { BusinessProfile } from './business-profile.entity';

@Entity()
export class BusinessImage {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column()
  url: string;

  @ManyToOne(() => BusinessProfile, (business) => business.images, {
    onDelete: 'CASCADE',
  })
  business: BusinessProfile;
}
