interface ComponentMetadata {
  selector: string;
  template: string;
}

function Component(metadata: ComponentMetadata) {
  return function <T extends { new (...args: any[]): any }>(constructor: T) {
    return constructor;
  };
}

@Component({
  selector: 'app-student',
  template: `
    <h2>Hands-On 7 - Angular Component</h2>
    <ul>
      <li *ngFor="let student of students">{{ student }}</li>
    </ul>
  `
})
export class StudentComponent {
  students: string[] = ["Alice", "Bob", "Charlie"];
}
