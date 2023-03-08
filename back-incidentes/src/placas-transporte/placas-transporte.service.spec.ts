import { Test, TestingModule } from '@nestjs/testing';
import { PlacasTransporteService } from './placas-transporte.service';

describe('PlacasTransporteService', () => {
  let service: PlacasTransporteService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [PlacasTransporteService],
    }).compile();

    service = module.get<PlacasTransporteService>(PlacasTransporteService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
