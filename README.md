# Apache Log Analyzer

Utility to analyze Apache's logs (Combined Log Format), and make some sense out of it. It outputs some of the most useful information per reques, and can sort requests based on their response size.

## Requirements

You need to have the following Linux utilities:
 * tail
 * awk
 * sort
 * head

They are typically pre-installed in any Linux distribution. 

## Usage
./analyzer.py <options> <log filename>
Default order is chronological

## Options
* -i defines input size (number of lines to analyze)

* -s defines sort method --> rc

  * ``ascsize`` sort in ascending response size order
  * ``dessize`` reverse sort in descending response size order

* -o defines output size (number of lines to output)

## Examples

### Out of the last 10000 requests, get the top 100 that generated the largest responses.

	./analyzer.sh -i 10000 -s dessize -o 100 > output.txt

### Out of the last 100 requests, get the top 10 that generated the smallest responses

	./analyzer.sh -i 10000 -s ascsize -o 100 > output.txt

## Notes
The output of analyzer, can be piped to any other shell utility.

## PS
Fuck shell scripting!