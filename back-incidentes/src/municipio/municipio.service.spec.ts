import { Test, TestingModule } from '@nestjs/testing';
import { MunicipioService } from './municipio.service';

describe('MunicipioService', () => {
  let service: MunicipioService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [MunicipioService],
    }).compile();

    service = module.get<MunicipioService>(MunicipioService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
