import { Test, TestingModule } from '@nestjs/testing';
import { TipoIncidenteService } from './tipo-incidente.service';

describe('TipoIncidenteService', () => {
  let service: TipoIncidenteService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [TipoIncidenteService],
    }).compile();

    service = module.get<TipoIncidenteService>(TipoIncidenteService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
