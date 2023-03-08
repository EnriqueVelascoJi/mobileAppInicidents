import { Test, TestingModule } from '@nestjs/testing';
import { RepuveService } from './repuve.service';

describe('RepuveService', () => {
  let service: RepuveService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [RepuveService],
    }).compile();

    service = module.get<RepuveService>(RepuveService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
