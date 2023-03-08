import { RepuveService } from './repuve.service';
export declare class RepuveController {
    private readonly repuveService;
    constructor(repuveService: RepuveService);
    searchByPlate(plate: string): Promise<{
        plate: string;
    }>;
}
