import { Test, TestingModule } from '@nestjs/testing';
import { ModoTransporteService } from './modo-transporte.service';

describe('ModoTransporteService', () => {
  let service: ModoTransporteService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [ModoTransporteService],
    }).compile();

    service = module.get<ModoTransporteService>(ModoTransporteService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
