import { User } from 'src/user/entities/user.entity';
import {
  Column,
  Entity,
  JoinColumn,
  OneToMany,
  OneToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { BusinessImage } from './business-image.entity';
import { Service } from 'src/service/entities/service.entity';

@Entity()
export class BusinessProfile {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @OneToOne(() => User, (user) => user.businessProfile)
  @JoinColumn()
  user: User;

  @Column()
  businessName: string;

  @Column()
  phone: string;

  @Column({ type: 'text', nullable: true })
  description?: string;

  @Column()
  address: string;

  @Column({ type: 'decimal', nullable: true })
  priceMin: number;

  @Column({ type: 'decimal', nullable: true })
  priceMax: number;

  @OneToMany(() => BusinessImage, (image) => image.business, { cascade: true })
  images: BusinessImage[];

  @OneToMany(() => Service, (service) => service.business)
  services: Service[];
}
