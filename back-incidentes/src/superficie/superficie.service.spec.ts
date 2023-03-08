import { Test, TestingModule } from '@nestjs/testing';
import { SuperficieService } from './superficie.service';

describe('SuperficieService', () => {
  let service: SuperficieService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [SuperficieService],
    }).compile();

    service = module.get<SuperficieService>(SuperficieService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
