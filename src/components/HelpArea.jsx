import HelpBox from './HelpBox';
import './HelpArea.css';

const HELP_ITEMS = [
  {
    id: 'h1',
    title: 'What is CI?',
    text: 'Continuous integration (CI) is the practice of automating the integration of code changes from multiple contributors into a single software project.',
  },
  {
    id: 'h2',
    title: 'What is CD?',
    text: 'The "CD" in CI/CD refers to continuous delivery and/or continuous deployment, which are related concepts that sometimes get used interchangeably. Both are about automating further stages of the pipeline.',
  },
  {
    id: 'h3',
    title: 'What Is DevOps?',
    text: 'DevOps is a set of practices, tools, and a cultural philosophy that automate and integrate the processes between software development and IT teams. It emphasizes team empowerment, cross-team communication and collaboration, and technology automation.',
  },
];

function HelpArea() {
  return (
    <section data-testid="help-area" id="help-area">
      {HELP_ITEMS.map((item) => (
        <HelpBox key={item.id} title={item.title} text={item.text} />
      ))}
    </section>
  );
}

export default HelpArea;
