import ArgumentParser
import Consler

//    You create a command by creating a Struct and having it conform to ParsableCommand

struct ColorPrint: ParsableCommand {
    
    static var configuration = CommandConfiguration(
        commandName: "colorPrint",
        abstract: "This will format you printing")
    
    //    You can use a flag for scenarios where 1 of 2 state
    //    can be selected. Flags will default to false
    //
    //    @Flag(
    //        name: [.customShort("b"), .customLong("bold") ],
    //        help: "Determines if the value is bold")
    //    var isBold: Bool
    
    
    //    Options are great when you want to provide more than
    //    2 states for the user to select from. These can be
    //    an `Optional<Wrapped>` type or you can provide a default.
    
    @Option(
        name: .shortAndLong,
        default: .normal,
        help: "The color to format the prinatable-value in")
    var color: Color
    
    //    You can also provide the user with the ability to combine
    //    multiple options together by providing an `Array<T>` and
    //    using the ArrayParsingStrategy initializer.
    
    @Option(
        name: .shortAndLong,
        parsing: .singleValue,
        help: "The format for the printable-value")
    var formats: [Format]
    
    //    The arguments are the values to be operated on.
    
    @Argument(help: "The values to be formated")
    var printableValue: String
    
    //    If you like, you can validate the user's inputs/arguments
    //    checking inside the validate method and throwing the
    //    provided `ValidationError` type. Errors will be presented
    //    to the user.
    //
    //    mutating func validate() throws {
    //        throw ValidationError("It shouldn't be this way")
    //    }
    
    
    //    Do your computation/work in the run method
    
    func run() throws {
        
    //    If you'd like to use your own custom error handling, you
    //    can do so by using the provided ExitCode api
    //
    //    ExitCode(1)
        
        let textFormats = formats.compactMap { $0.conslerValue }
        
        let userSelection: OutputDescriptor = .custom(
            color: color.conslerValue,
            formats: Set(textFormats))
        
        let formatedOutput = ConslerOutput(printableValue).describedBy(userSelection)
        
        Consler.output(formatedOutput)
        
    }
    
}


//    Make sure to call the static main method, otherwise you command will not run.

ColorPrint.main()
