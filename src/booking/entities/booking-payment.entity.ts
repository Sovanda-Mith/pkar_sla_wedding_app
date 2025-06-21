import {
  Column,
  CreateDateColumn,
  Entity,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { Booking } from './booking.entity';

@Entity()
export class BookingPayment {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @ManyToOne(() => Booking, { onDelete: 'CASCADE' })
  booking: Booking;

  @Column()
  method: string;

  @Column({ type: 'decimal' })
  amount: number;

  @Column({ default: false })
  isPaid: boolean;

  @CreateDateColumn()
  paidAt: Date;
}
