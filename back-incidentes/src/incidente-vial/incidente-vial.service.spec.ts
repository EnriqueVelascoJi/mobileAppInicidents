import { Test, TestingModule } from '@nestjs/testing';
import { IncidenteVialService } from './incidente-vial.service';

describe('IncidenteVialService', () => {
  let service: IncidenteVialService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [IncidenteVialService],
    }).compile();

    service = module.get<IncidenteVialService>(IncidenteVialService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
