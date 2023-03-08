import { Test, TestingModule } from '@nestjs/testing';
import { InvolucradosService } from './involucrados.service';

describe('InvolucradosService', () => {
  let service: InvolucradosService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [InvolucradosService],
    }).compile();

    service = module.get<InvolucradosService>(InvolucradosService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
